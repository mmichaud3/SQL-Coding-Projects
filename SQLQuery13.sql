USE MASTER;
DROP DATABASE Library
CREATE DATABASE Library;

USE [Library];

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50)  NOT NULL,
		Address VARCHAR(50)  NOT NULL
	);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50)  NOT NULL
	);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		PublisherName VARCHAR(50),
		FOREIGN KEY (PublisherName) REFERENCES PUBLISHER(PublisherName), --links to PUBLISHER
		Title VARCHAR(50) NOT NULL
	);

CREATE TABLE BOOK_COPIES (
	BookID INT,
		FOREIGN KEY (BookID) REFERENCES BOOKS(BookID), --links to BOOKS
	BranchID INT,
		FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID), --links to Library_Branch
		Number_Of_Copies VARCHAR(50)  NOT NULL
	);


CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Name VARCHAR(50) NOT NULL,
		Address VARCHAR(50)  NOT NULL,
		Phone VARCHAR(50)  NOT NULL
	);

CREATE TABLE BOOK_LOANS (
	BookID INT,
		FOREIGN KEY (BookID) REFERENCES BOOKS(BookID), --links to BOOKS
	BranchID INT,
		FOREIGN KEY (BranchID) REFERENCES LIBRARY_BRANCH(BranchID), --links to Library_Branch
	CardNo INT,
		FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo), --LINKS bORROWER
		DateOut  VARCHAR(50)  NOT NULL,
		DateDue  VARCHAR(50)  NOT NULL
	);




CREATE TABLE BOOK_AUTHORS (
    BookID INT,
		FOREIGN KEY (BookID) REFERENCES BOOKS(BookID), --links to BOOKS
		AuthorName VARCHAR(50)  NOT NULL
	);

	GO

INSERT INTO PUBLISHER (PublisherName, Address, Phone)
VALUES  ('Random House', '1745 Broadway, New York,NY', '2127829000'),
		('Penguin', '375 Hudson St, New York', '2127821111'),
		('Simon & Schuster', '1230 Avenue of the Americas, New York,NY', '2127823333')

;


INSERT INTO  LIBRARY_BRANCH (BranchName, Address)
VALUES ('Sharpstown', '123 Main St'),
	   ('Central', '123 Elm St'),
	   ('Bridgeport', '123 Seaside Ave'),
	   ('Fairfield', '123 Casmir Dr')
;

INSERT INTO BOOKS (Title, PublisherName)
VALUES ('The Lost Tribe', 'Random House'),
       ('The Gunslinger', 'Random House'),
	   ('IT', 'Random House'),
	   ('Harry Potter and the Sorcerer''s Stone', 'Random House'),
	   ('A Farewell To Arms', 'Random House'),
	   ('Ready Player One', 'Random House'),
	   ('A Dance with Dragons', 'Random House'),
	   ('World War Z', 'Random House'),
	   ('Born to Run', 'Penguin'),
	   ('The Hunger Games', 'Penguin'),
	   ('Ender''s Game', 'Penguin'),
	   ('The Maze Runner', 'Penguin'),
	   ('Divergent', 'Penguin'),
	   ('American Sniper', 'Penguin'),
	   ('The Martian', 'Penguin'),
	   ('The Girl with the Dragon Tattoo', 'Simon & Schuster'),
	   ('The Girl on the Train', 'Simon & Schuster'),
	   ('The Fellowship of the Ring', 'Simon & Schuster'),
	   ('American Assasin', 'Simon & Schuster'),
	   ('Artemis', 'Simon & Schuster')
	;

INSERT INTO BOOK_AUTHORS (AuthorName)
VALUES  ('Mark Lee'),
        ('Stephen King'),
		('J.K. Rowling'),
		('Ernest Hemingway'),
		('Ernest Cline'),
		('George R.R. Martin'),
		('Max Brooks'),
		('Christopher McDougall'),
		('Suzanne Collins'),
		('Orson Scott Card'),
		('James Dashner'),
		('Veronica Roth'),
		('Jim DeFelice'),
		('Andy Weir'),
		('Steig Larsson'),
		('Paula Hawkins'),
		('J.R. Tolkein'),
		('Vince Flynn')
	;
INSERT INTO BORROWER (Name, Address, Phone)
VALUES ('Michael Michaud', '703 Bellevue Ave', '2035555555'),
	   ('Anna Soracco', '703 Bellevue Ave', '2033333333'),
	   ('Dan Bennis', '3 Austin Pl', '2038888888'),
	   ('Chris Clemente', '4 Trumbull Ct', '2039999999'),
	   ('Eric Anderson', '9 Milford St', '2032556666'),
	   ('Doug Bross', '11 Ennis St', '2039934444'),
	   ('Chanel Merced', '12 Stratford Pl', '2038884444'),
	   ('Felipe Soltero', '13 California St', '2033453533')
	;
	
INSERT INTO BOOK_COPIES (BookID, BranchID, Number_Of_Copies)
VALUES  ('1','1', '2'),
		('2', '1', '2'),
		('3', '1', '2'),
		('4', '1', '2'),
		('5', '1', '2'),
		('6', '1', '2'),
		('7', '1', '2'),
		('8', '1', '2'),
		('9', '1', '2'),
		('10', '1', '2'),
		('2', '2', '2'),
		('3', '2', '2'),
		('4', '2', '2'),
		('5', '2', '2'),
		('6', '2', '2'),
		('7', '2', '2'),
		('8', '2', '2'),
		('9', '2', '2'),
		('10', '2', '2'),
		('11', '2', '2'),
		('12', '3', '2'),
		('13', '3', '2'),
		('14', '3', '2'),
		('15', '3', '2'),
		('16', '3', '2'),
		('17', '3', '2'),
		('18', '3', '2'),
		('19', '3', '2'),
		('20', '3', '2'),
		('1', '3', '2'),
		('12', '4', '2'),
		('13', '4', '2'),
		('14', '4', '2'),
		('15', '4', '2'),
		('16', '4', '2'),
		('17', '4', '2'),
		('18', '4', '2'),
		('19', '4', '2'),
		('20', '4', '2'),
		('1', '4', '2')
	;

INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue)
VALUES  ('1', '1', '1', '7/1/19', '7/17/19'),
		('2', '1', '1', '7/1/19', '7/17/19'),
		 ('3', '1', '1', '7/1/19', '7/17/19'),
		 ('4', '1', '1', '7/1/19', '7/17/19'),
		 ('5', '1', '1', '7/1/19', '7/17/19'),
		 ('6', '1', '1', '7/1/19', '7/17/19'),
		 ('7', '1', '1', '7/1/19', '7/17/19'),
		 ('8', '1', '1', '7/1/19', '7/17/19'),
		  ('9', '1', '1', '7/1/19', '7/17/19'),
		 ('10', '1', '1', '7/1/19', '7/17/19'),
		 ('1', '1', '2', '7/1/19', '7/17/19'),
		('2', '1', '2', '7/1/19', '7/17/19'),
		 ('3', '1', '2', '7/1/19', '7/17/19'),
		 ('4', '1', '2', '7/1/19', '7/17/19'),
		 ('5', '1', '2', '7/1/19', '7/17/19'),
		 ('6', '1', '2', '7/1/19', '7/17/19'),
		 ('7', '1', '2', '7/1/19', '7/17/19'),
		 ('8', '1', '2', '7/1/19', '7/17/19'),
		  ('9', '1', '2', '7/1/19', '7/17/19'),
		 ('10', '1', '2', '7/1/19', '7/17/19'),
		 ('2', '2', '3', '7/1/19', '7/17/19'),
		 ('3', '2', '3', '7/1/19', '7/17/19'),
		 ('4', '2', '3', '7/1/19', '7/17/19'),
		 ('5', '2', '3', '7/1/19', '7/17/19'),
		 ('6', '2', '3', '7/1/19', '7/17/19'),
		 ('7', '2', '3', '7/1/19', '7/17/19'),
		 ('8', '2', '3', '7/1/19', '7/17/19'),
		  ('9', '2', '3', '7/1/19', '7/17/19'),
		 ('10', '2', '3', '7/1/19', '7/17/19'),
		 ('11', '2', '3', '7/1/19', '7/17/19'),
		 ('2', '2', '4', '7/1/19', '7/17/19'),
		 ('3', '2', '4', '7/1/19', '7/17/19'),
		 ('4', '2', '4', '7/1/19', '7/17/19'),
		 ('5', '2', '4', '7/1/19', '7/17/19'),
		 ('6', '2', '4', '7/1/19', '7/17/19'),
		 ('7', '2', '4', '7/1/19', '7/17/19'),
		 ('8', '2', '4', '7/1/19', '7/17/19'),
		  ('9', '2', '4', '7/1/19', '7/17/19'),
		 ('10', '2', '4', '7/1/19', '7/17/19'),
		 ('11', '2', '4', '7/1/19', '7/17/19'),
		('12', '3', '5', '7/1/19', '7/17/19'),
		 ('13', '3', '5', '7/1/19', '7/17/19'),
		 ('14', '3', '5', '7/1/19', '7/17/19'),
		 ('15', '3', '5', '7/1/19', '7/17/19'),
		 ('16', '3', '5', '7/1/19', '7/17/19'),
		('17', '3', '5', '7/1/19', '7/17/19'),
		 ('18', '3', '5', '7/1/19', '7/17/19'),
		 ('19', '3', '5', '7/1/19', '7/17/19'),
		 ('20', '3', '5', '7/1/19', '7/17/19'),
		 ('1', '3', '5', '7/1/19', '7/17/19'),
		 ('12', '3', '6', '7/1/19', '7/17/19'),
		 ('13', '3', '6', '7/1/19', '7/17/19'),
		  ('14', '4', '7', '7/1/19', '7/17/19'),
		 ('15', '4', '7', '7/1/19', '7/17/19'),
		 ('16', '4', '7', '7/1/19', '7/17/19'),
		('17', '4', '7', '7/1/19', '7/17/19'),
		 ('18', '4', '7', '7/1/19', '7/17/19'),
		 ('19', '4', '7', '7/1/19', '7/17/19'),
		 ('20', '4', '7', '7/1/19', '7/17/19'),
		 ('1', '4', '7', '7/1/19', '7/17/19')
	;
	GO
----------------- PROCEDURES----------------------------------------------------------------------


------------Procedure (How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
GO
CREATE PROCEDURE   SelectCopies  @Book nvarchar(25), @Branch nvarchar(25)  -- Finds number of copies based on bookID number
AS
SELECT * FROM BOOK_COPIES WHERE BookID = @Book AND BranchID = @Branch
GO

EXEC SelectCopies @Book= '1', @Branch = '1'

---------------------------------------------------------|

-------- Procedure ( How many copies of the book titled "The Lost Tribe" are owned by each library branch?)

GO
CREATE PROCEDURE  SelectAllCopies @Book nvarchar(25)  -- Finds number of copies in a branch based on bookId number
AS
SELECT * FROM BOOK_COPIES  WHERE BookID = @Book
GO

EXEC SelectAllCopies @Book = '1'

------------------------------------|

-------- Procedure (Retrieve the names of all borrowers who do not have any books checked out.)

 GO
 CREATE PROCEDURE Borrowers @DueDate nvarchar(30)
 AS
 SELECT BORROWER.Name FROM BORROWER, BOOK_LOANS WHERE DateDue = @DueDate
 GO

 EXEC Borrowers @DueDate = NULL

------------------------------------------------------|

------- Procedure (For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.)
 GO
CREATE PROCEDURE SharpstownDueDate @DueDate nvarchar(30), @BranchName nvarchar(30) 
AS
 SELECT BOOKS.Title, BORROWER.Name, BORROWER.Address
 FROM BOOK_LOANS
 INNER JOIN BOOKS ON BOOKS.BookID =BOOK_LOANS.BookID
 INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
 INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
 WHERE DateDue = @DueDate AND BranchName = @BranchName
 GO

 EXEC SharpstownDueDate @BranchName = 'Sharpstown', @DueDate = '7/17/19'  

-----------------------------------------------|

--------------Procedure (  For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

GO
CREATE PROCEDURE LoanTotalByBranch
AS
SELECT COUNT(DateOut), BranchName
FROM BOOK_LOANS
INNER JOIN LIBRARY_BRANCH ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
WHERE DateOut = '7/1/19'
GROUP BY BranchName
GO



					

--------------------------------------------------|


--------------Procedure ( Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.


GO
CREATE PROCEDURE LoansMoreThanFive
AS
SELECT Name, Address, COUNT(DateOut)
FROM BORROWER
INNER JOIN BOOK_LOANS ON BORROWER.CardNo = BOOK_LOANS.CardNo
GROUP BY BORROWER.Name, BORROWER.Address
HAVING COUNT(DateOut)>5
GO
 
 EXEC LoansMoreThanFive

 -------------------------------|

 -------------- Procedure ( For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

 GO
 CREATE PROCEDURE StephenKing  @Author nvarchar(50), @BranchName nvarchar(25)
 AS
 SELECT Title, AuthorName, Number_Of_Copies
 FROM BOOKS
 INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID
 INNER JOIN BOOK_COPIES ON BOOKS.BookID = BOOK_COPIES.BookID
 INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
 WHERE AuthorName = @Author AND BranchName= @BranchName
 GO

 EXEC StephenKing @Author = 'Stephen King', @BranchName = 'Central'
 
 ------------------------------------------------------------------------|


