1) implementation A has 3 classes, CartEntry, ShoppingCart, and Order
implementation B has the same three classes 

2) CartEntry is a class that is initialized a unit price and a quantity

ShoppingCart is a class that is initialized with an array of entries (presumably instances of CartEntry but ShoppingCart does not "know" that)

Order is initialized with a cart variable that is an instance of a ShoppingCart

3) Class relations: Order contains one ShoppingCart, and one ShoppingCart can contain several CartEntrys. 

4) CartEntry stores a unit price and a quantity, ShoppingCart stores an array of entries, and Order stores an instance of a ShoppingCart. The data stored doesn't vary between implementations

5) In A, only Order has a method, which is price. It calculates the total price of an order with sales tax by going over every item in the cart, multiplying price by quantity, adding that together, then adding in sales tax for that amount. 

In B each class has a price method. ShoppingCart uses CartEntry's price method to calculate the price of all of its entries and Order uses ShoppingCart's price method to calculate the total price of the order. 

6) I described the methods above. In A Order does not delegate to lower level classes to calculate total price. It knows not only that there is a cart, but that the cart has entries which have a quantity and unit price. It has to know a lot about other classes to make the calculation.

In B Order DOES delegate to lower level classes and it uses ShoppingCart's price method, which in turn implements CartEntry's price method. Order ends up knowing nothing at all about CartEntry. 

7) If items are cheaper bought in bulk, the math would have to be changed in Order's total price method if quantity for an entry was over a certain amount. That would be pretty confusing. 
In B, the logic would only have to be handled in CartEntry and it could update before it even got to the point of being in the Order

8) B definitely adhered to the single responsibility principle better. 

9)B is definitely more loosely coupled as well since it eliminated Order knowing so much about its neighbors. 