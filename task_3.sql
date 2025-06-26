create schema library;
use library;
create table book(
Book_id int primary key,
Book_name varchar(250),
available_books int,
total_books int,
author_name varchar(100));
-- The member table contains information about the members, 
-- which helps identify who belongs to the library.
select member_id from members;
create table members(
member_id int primary key,
name varchar(100) not null,
book_id int ,
phone_number int ,
address TEXT,
email varchar(100));
-- The borrow table contains the book_id and member_id, which help identify who has borrowed 
-- books from the library. It also helps determine who hasn't returned books by the due date.
CREATE TABLE borrow (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    foreign key(member_id) references  members(member_id),
	foreign key (book_id) references book(book_id));
    -- The fine table contains the borrow_id, which helps identify users who have 
    -- not returned the book. This allows us to easily track those who haven't returned books by the due date."
create table fine(
    book_id int,
    book_name varchar(100),
    member_id int,
    borrow_id int,
    fine_amount decimal(10,2),
    fine_amount_duedate int,
    paid boolean default false,
    foreign key(borrow_id) references borrow (borrow_id));
    INSERT INTO library.book (Book_id, Book_name, available_books, total_books, author_name) VALUES
(6, 'Pride and Prejudice', 2, 4, 'Jane Austen'),
(7, 'The Catcher in the Rye', 1, 3, 'J.D. Salinger'),
(8, 'The Hobbit', 2, 5, 'J.R.R. Tolkien'),
(9, 'Moby Dick', 0, 2, 'Herman Melville'),
(10, 'The Road', 3, 4, 'Cormac McCarthy'),
(11, 'Jane Eyre', 1, 3, 'Charlotte Brontë'),
(12, 'Brave New World', 2, 3, 'Aldous Huxley'),
(13, 'Inferno', 1, 2, 'Dan Brown'),
(14, 'The Book Thief', 2, 4, 'Markus Zusak'),
(15, 'The Kite Runner', 0, 2, 'Khaled Hosseini');
INSERT INTO members (member_id, name, book_id, phone_number, address, email) VALUES
(106, 'Fiona Davis', 6, 9876500001, '12 Willow St', 'fiona@gmail.com'),
(107, 'George White', 7, 9876500002, '34 Maple Rd', 'george@gmail.com'),
(108, 'Helen Carter', NULL, 9876500003, '56 Aspen Ln', 'helen@gmail.com'),
(109, 'Ian Scott', 8, 9876500004, '78 Cherry Ct', 'ian@gmail.com'),
(110, 'Jackie Chan', NULL, 9876500005, '90 Palm Ave', 'jackie@gmail.com'),
(111, 'Kiran Rao', 9, 9876500006, '123 Lotus Blvd', 'kiran@gmail.com'),
(112, 'Liam Turner', 10, 9876500007, '234 Rose Dr', 'liam@gmail.com'),
(113, 'Mira Kapoor', NULL, 9876500008, '345 Orchid St', 'mira@gmail.com'),
(114, 'Nathan Roy', 11, 9876500009, '456 Pine Way', 'nathan@gmail.com'),
(115, 'Olivia Queen', NULL, 9876500010, '567 Fir Cres', 'olivia@gmail.com');




INSERT INTO members (member_id, name, book_id, phone_number, address, email) VALUES
(106, 'Fiona Davis', 6, 9876500001, '12 Willow St', 'fiona@gmail.com'),
(107, 'George White', 7, 9876500002, '34 Maple Rd', 'george@gmail.com'),
(108, 'Helen Carter', NULL, 9876500003, '56 Aspen Ln', 'helen@gmail.com'),
(109, 'Ian Scott', 8, 9876500004, '78 Cherry Ct', 'ian@gmail.com'),
(110, 'Jackie Chan', NULL, 9876500005, '90 Palm Ave', 'jackie@gmail.com'),
(111, 'Kiran Rao', 9, 9876500006, '123 Lotus Blvd', 'kiran@gmail.com');



ALTER TABLE members MODIFY phone_number BIGINT;
INSERT INTO borrow (borrow_id, member_id, book_id, borrow_date, due_date, return_date) VALUES
(1005, 106, 6, '2025-06-12', '2025-06-20', '2025-06-18'),
(1006, 107, 7, '2025-06-14', '2025-06-22', NULL),
(1007, 108, 8, '2025-06-10', '2025-06-18', '2025-06-25'),  -- returned late
(1008, 109, 9, '2025-06-15', '2025-06-23', NULL),  -- overdue
(1009, 110, 10, '2025-06-13', '2025-06-21', '2025-06-21'),  -- returned on time
(1010, 111, 11, '2025-06-16', '2025-06-24', NULL);  -- not returned


INSERT INTO fine (book_id, book_name, member_id, borrow_id, fine_amount, fine_amount_duedate, paid) VALUES
(8, 'The Hobbit', 108, 1007, 35.00, 7, false),
(9, 'Moby Dick', 109, 1008, 25.00, 3, false),
(7, 'The Catcher in the Rye', 107, 1006, 20.00, 4, false),
(11, 'Jane Eyre', 111, 1010, 15.00, 2, false);


-- task 3 -- exercise to practice for and ,like,or and between ,orderby 
-- or-Used to combine multiple conditions, returns rows if any condition is true.
-- NOT-Used to exclude rows that match a condition.
--  3. LIKE-Used to match a pattern in a text column (with % as a wildcard).
-- ORDER BY-Used to sort the results of a query by one or more columns.


-- 1.Display all columns of all members.
select* from members;
-- 2.Display only book_id, book_name, and available_books from the book table.
select  book_id,book_name,available_books from book;
-- 3.Show name, phone_number, and email of all members who have borrowed books.
select name,phone_number,email from members m join borrow b on m.member_id=b.member_id
where m.member_id=b.member_id;
-- 4. Show all books where available_books is less than 3 and total_books is more than 5.
select book_name ,book_id,available_books ,total_books from book 
where available_books >3 and total_books<5;
-- Q5. Find all members who live on a street with “Cherry” or “Palm” in the address.
select name,member_id,address from members 
where address like '%cherry%' or address like '%palm%';
-- List members whose names start with 'K' and have an email ending in @gmail.com.
select * from  members where name like 'k%' and  email like '%@gmail.com%';
-- Q7. Get borrow records where return_date is NULL or later than due_date.
select borrow_date ,borrow_id,return_date from borrow
where return_date is null or due_date<return_date;
-- Q8. Show books where the book name contains the word "Story".
 select book_name from book where book_name like '%story%';
-- Q9. Find books where total_books is between 5 and 15.
select book_name , book_id from book 
where total_books between 5 and 15;
-- 10.Get members whose phone_number starts with 98765 and live in addresses that contain “Ave”.
select phone_number,name from members
where phone_number like '98765%' and address like '%ave%';
-- Q11. List all books sorted by book_name in ascending order.

select book_name from book  order by book_name ;
-- Q12. Show members sorted by member_id in descending order.
select name,member_id from members 
order by member_id desc;
-- Q13. Display borrow records sorted first by due_date (ascending), then by member_id.
select * from borrow order by due_date ,member_id;
-- Q14. Show fines sorted by fine_amount from highest to lowest.
select fine_amount from fine  order by fine_amount desc;
-- Q15. List all members sorted by name alphabetically and then by member_id.
select name ,member_id from members order by name asc ,member_id;










































































































