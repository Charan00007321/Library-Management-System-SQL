create database project_sql;
use project_sql;

-- Table: tbl_publisher 
CREATE TABLE tbl_publisher ( 
    publisher_PublisherName VARCHAR(255) PRIMARY KEY, 
    publisher_PublisherAddress TEXT, 
    publisher_PublisherPhone VARCHAR(15) 
); 
select * from tbl_publisher;
 -- Table: tbl_book 
CREATE TABLE tbl_book ( 
    book_BookID INT PRIMARY KEY, 
    book_Title VARCHAR(255), 
    book_PublisherName VARCHAR(255), 
    FOREIGN KEY (book_PublisherName) REFERENCES 
tbl_publisher(publisher_PublisherName) 
); 
select * from tbl_book;
 -- Table: tbl_book_authors 
CREATE TABLE tbl_book_authors ( 
    book_authors_AuthorID INT PRIMARY KEY auto_INCREMENT, 
    book_authors_BookID INT, 
    book_authors_AuthorName VARCHAR(255),
     FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) 
); 
select * from tbl_book_authors;
 -- Table: tbl_library_branch 
CREATE TABLE tbl_library_branch ( 
    library_branch_BranchID INT PRIMARY KEY auto_INCREMENT, 
    library_branch_BranchName VARCHAR(255), 
    library_branch_BranchAddress TEXT 
); 
select * from tbl_library_branch;
 -- Table: tbl_book_copies 
CREATE TABLE tbl_book_copies ( 
    book_copies_CopiesID INT PRIMARY KEY auto_INCREMENT, 
    book_copies_BookID INT, 
    book_copies_BranchID INT, 
    book_copies_No_Of_Copies INT, 
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID), 
    FOREIGN KEY (book_copies_BranchID) REFERENCES 
tbl_library_branch(library_branch_BranchID) 
); 
select * from tbl_book_copies;
 -- Table: tbl_borrower 
CREATE TABLE tbl_borrower ( 
    borrower_CardNo INT PRIMARY KEY, 
    borrower_BorrowerName VARCHAR(255), 
    borrower_BorrowerAddress TEXT, 
    borrower_BorrowerPhone VARCHAR(15) 
); 
 -- Table: tbl_book_loans 
CREATE TABLE tbl_book_loans ( 
    book_loans_LoansID INT PRIMARY KEY auto_INCREMENT, 
    book_loans_BookID INT, 
    book_loans_BranchID INT, 
    book_loans_CardNo INT, 
    book_loans_DateOut DATE, 
    book_loans_DueDate DATE, 
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID), 
    FOREIGN KEY (book_loans_BranchID) REFERENCES 
tbl_library_branch(library_branch_BranchID), 
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) 
); 




use project_sql;
SELECT
book. book_Title,
copies. book_copies_no_Of_Copies
FROM tbl_book AS book
JOIN tbl_book_copies AS copies
ON book.book_BookID = copies.book_copies_BookID
JOIN tbl_library_branch AS branch
ON copies.book_copies_BranchID - branch.library_branch_BranchID
WHERE book. book_Title = " The Lost Tribe"
AND branch. library_branch_BranchName = "Sharpstown ";



use project_sql;
SELECT
    copies.book_copies_No_Of_Copies
FROM tbl_book AS book
JOIN tbl_book_copies AS copies
    ON book.book_BookID = copies.book_copies_BookID
JOIN tbl_library_branch AS branch
    ON copies.book_copies_BranchID = branch.library_branch_BranchID
WHERE book.book_Title = 'The Lost Tribe'
  AND branch.library_branch_BranchName = 'Sharpstown';



use project_sql;
SELECT
    borrower.borrower_BorrowerName
FROM tbl_borrower AS borrower
LEFT JOIN tbl_book_loans AS loans
    ON borrower.borrower_CardNo = loans.book_loans_CardNo
WHERE loans.book_loans_CardNo IS NULL;




use project_sql;
SELECT
    book.book_Title,
    borrower.borrower_BorrowerName,
    borrower.borrower_BorrowerAddress
FROM tbl_book_loans AS loans
JOIN tbl_book AS book
    ON loans.book_loans_BookID = book.book_BookID
JOIN tbl_borrower AS borrower
    ON loans.book_loans_CardNo = borrower.borrower_CardNo
JOIN tbl_library_branch AS branch
    ON loans.book_loans_BranchID = branch.library_branch_BranchID
WHERE branch.library_branch_BranchName = 'Sharpstown'
  AND loans.book_loans_DueDate = '2018-02-03';
  
  
  
use project_sql;
SELECT
    branch.library_branch_BranchName,
    COUNT(loans.book_loans_LoansID) AS Total_Books_Loaned
FROM tbl_library_branch AS branch
LEFT JOIN tbl_book_loans AS loans
    ON branch.library_branch_BranchID = loans.book_loans_BranchID
GROUP BY branch.library_branch_BranchID,
         branch.library_branch_BranchName;
         
use project_sql;
SELECT
    borrower.borrower_BorrowerName,
    borrower.borrower_BorrowerAddress,
    COUNT(loans.book_loans_LoansID) AS Books_Checked_Out
FROM tbl_borrower AS borrower
JOIN tbl_book_loans AS loans
    ON borrower.borrower_CardNo = loans.book_loans_CardNo
GROUP BY
    borrower.borrower_CardNo,
    borrower.borrower_BorrowerName,
    borrower.borrower_BorrowerAddress
HAVING COUNT(loans.book_loans_LoansID) > 5;



use project_sql;
  SELECT
    b.book_Title,
    COALESCE(c.book_copies_No_Of_Copies, 5) AS book_copies_No_Of_Copies
FROM tbl_book b
JOIN tbl_book_authors a
    ON b.book_BookID = a.book_authors_BookID
LEFT JOIN tbl_book_copies c
    ON b.book_BookID = c.book_copies_BookID
    AND c.book_copies_BranchID = 2
WHERE a.book_authors_AuthorName = 'Stephen King';