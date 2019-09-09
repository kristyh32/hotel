require_relative 'test_helper'
require 'pry'

describe "Hotel Booker" do
  describe "HotelBooker instantiation" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "contains an array of all instances of Room" do
      expect(@hotel_booker.rooms).must_be_kind_of Array
      expect(@hotel_booker.rooms[2]).must_be_kind_of Hotel::Room
      expect(@hotel_booker.rooms.length).must_equal 20
    end
    
    it "makes an empty array to hold reservations" do
      expect(@hotel_booker.reservations).must_be_kind_of Array 
    end
    
  end
  
  describe "print rooms" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "will display a list of all hotel rooms" do
      list = @hotel_booker.print_rooms
      expect(list[-3]).must_equal "2"
    end
  end
  
  describe "new reservation" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "will create a new instance of reservation" do
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      expect(@hotel_booker.reservations[0]).must_be_kind_of Hotel::Reservation
      
    end
    
    it "will add the reservation to the @reservations variable" do
      before = @hotel_booker.reservations.length
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      after = @hotel_booker.reservations.length
      expect(after - before).must_equal 1
      
    end
    
    it "will not select a room that has already been reserved" do
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      room_1 = @hotel_booker.reservations[0].room
      room_2 = @hotel_booker.reservations[1].room
      expect(room_1).wont_equal room_2
      expect(room_1).must_be_kind_of Hotel::Room
      expect(room_2).must_be_kind_of Hotel::Room
    end
    
    it "will raise an ArgumentError if there are no avialable rooms" do
      20.times do
        @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      end
      expect{ @hotel_booker.new_reservation("10-22-2019", "10-23-2019") }.must_raise ArgumentError
    end
    
  end
  
  describe "find by date" do
    before do
      
      @hotel_booker = Hotel::HotelBooker.new(20)
      @hotel_booker.new_reservation("10-22-2019", "10-24-2019")
    end
    
    it "will return a list of all reservations that include the date passed in" do
      find = @hotel_booker.find_by_date("10-23-2019")
      expect(find).must_be_kind_of Array
      expect(find[0]).must_be_kind_of Hotel::Reservation
      expect(find.length).must_equal 1
    end
    
    it "will return an empty array if there are no reservations that match that date" do
      find = @hotel_booker.find_by_date("10-25-2019")
      expect(find).must_be_kind_of Array
      expect(find.length).must_equal 0
    end
    
  end
  
  
  describe "available rooms" do
    before do
      
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "will return an array of all avaialble rooms for a given date range" do
      avail_rooms = @hotel_booker.available_rooms("10-23-2019", "10-25-19")
      expect(avail_rooms).must_be_kind_of Array
    end
    
    it "will return the correct number of avaialbe rooms for a given date range" do
      5.times do
        @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      end
      
      5.times do
        @hotel_booker.new_reservation("10-22-2019", "10-24-2019")
      end
      
      avail_rooms = @hotel_booker.available_rooms("10-22-2019", "10-25-19")
      avail_rooms_2 = @hotel_booker.available_rooms("10-23-2019", "10-25-19")
      expect(avail_rooms.length).must_equal 10
      expect(avail_rooms_2.length).must_equal 15
    end
    
    it "will consider hotel block rooms taken when finding available rooms" do
      5.times do
        @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      end
      
      @hotel_booker.new_block("10-22-2019", "10-23-2019", 5, 150)
      avail_rooms = @hotel_booker.available_rooms("10-22-2019", "10-23-19")
      
      expect(avail_rooms.length).must_equal 10
    end
    
    it "will raise an error if not enough rooms are available to make the hotel block" do
      10.times do
        @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      end
      2.times do
        @hotel_booker.new_block("10-22-2019", "10-23-2019", 5, 150)
      end
      
      expect{@hotel_booker.new_block("10-22-2019", "10-23-2019", 5, 150)}.must_raise ArgumentError
      
    end
  end
  
  describe "new block" do
    before do
      
      @hotel_booker = Hotel::HotelBooker.new(20)
      @hotel_booker.new_block("10-22-2019", "10-23-2019", 5, 150)
    end
    
    it "will create a new instance of a hotel block" do
      expect(@hotel_booker.blocks[0]).must_be_kind_of Hotel::Block
    end
    
    it "the hotel block will contain an instance of date range" do
      expect(@hotel_booker.blocks[0].date_range).must_be_kind_of Hotel::DateRange
    end
    
    it "will contain instances of reservation stored in an array" do
      expect(@hotel_booker.blocks[0].reservations).must_be_kind_of Array
      expect(@hotel_booker.blocks[0].reservations[2]).must_be_kind_of Hotel::Reservation
    end
    
    it "will contain a unique room for each reservation" do
      reservations = @hotel_booker.blocks[0].reservations
      
      expect(reservations[0].room).wont_equal reservations[1].room
      expect(reservations[0].room).wont_equal reservations[2].room   
      expect(reservations[0].room).wont_equal reservations[3].room
      expect(reservations[0].room).wont_equal reservations[4].room
    end
    
    it "will add the new block to the array of blocks" do
      before = @hotel_booker.blocks.length
      @hotel_booker.new_block("10-22-2019", "10-25-2019", 5, 150)
      after = @hotel_booker.blocks.length
      expect(after - before).must_equal 1
    end
  end
  
  describe "avail from block" do
    
    
  end
  
  
  
  
  
end