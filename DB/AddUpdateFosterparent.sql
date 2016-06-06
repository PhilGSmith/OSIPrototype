CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUpdateFosterparent`(
	
    IN FosterParentID int,
    IN FirstName varchar(50),
    IN LastName varchar(50),
    IN DateOfBirth date,
    IN AdressID int,
    IN AddressLine1 varchar(100),
    IN AddressLine2 varchar(100),
    IN City varchar(100),
    IN State varchar(10),
    IN ZipCode varchar(20),
    OUT Status varchar(100),
    OUT NewID int
)
BEGIN

	Set Status  = 'ERROR';
    Set NewID = 0;

	If(FosterParentID >0) Then

			insert into Address(AddressID, AddressLine1, AddressLine2, CityName,StateCode, postalCode)
            VALUES( AddressLine1, AddressLine2, City,  State, ZipCode);
            
            Insert into FosterParent(Firstname, Lastname, DateofBirth,AddressID)
            VALUES( FirstName, LastName, DateOfBirth, LAST_INSERT_ID());
            
            Set NewID = LAST_INSERT_ID();
    
    Else
    
			Update Address Set
				AddressLine1 = AddressLine1,
                AddressLine2 = AddressLine2,
                CityName = City,
                StateCode = State,
				postalCode = ZipCode
            Where AddressID = AdressID;
            
            Update Fosterparent
            Set FirstName = FirstName,
				lastName = LastName,
                DateofBirth = DateOfBirth
            Where FosterParentID = FosterParentID;    
    End If;
End