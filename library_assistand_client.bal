import ballerina/io;

library_Assist_And_Client ep = check new ("http://localhost:9090");


public function main() returns error? {
    string remove_bookRequest = "The game";
    check ep->remove_book(remove_bookRequest);

    string locate_bookRequest = "ballerina";
    SingleBookResponse locate_bookResponse = check ep->locate_book(locate_bookRequest);
    io:println(locate_bookResponse);

    CreateUserRequest create_userRequest = {lastname: "Jonas", firstname: "Sarafina", email: "riita0@mail.com"};
    stream<CreateUserResponse, error?> create_userResponse = check ep->create_user(create_userRequest);
    check create_userResponse.forEach(function(CreateUserResponse value) {
        io:println(value);
    });

    CreateBookRequest create_bookRequest = {ISBN: "BI019", title: "The Game", author_1: "Major Martin", author_2: "Simon P", location: "first-Section", status: true};
    stream<CreateBookResponse, error?> create_bookResponse = check ep->create_book(create_bookRequest);
    check create_bookResponse.forEach(function(CreateBookResponse value) {
        io:println(value);
    });

    CreateBookRequest add_bookRequest = {ISBN: "BI109", title: "The Game", author_1: "Major Martin", author_2: "Simon P", location: "First-Section", status: true};
    stream<CreateBookResponse, error?> add_bookResponse = check ep->add_book(add_bookRequest);
    check add_bookResponse.forEach(function(CreateBookResponse value) {
        io:println(value);
    });

    CreateBookRequest borrow_bookRequest = {ISBN: "MI990", title: "Introduction to Artificial Intelligence", author_1: "Mark Zuberg", author_2: "Peter N", location: "3rd Section", status: true};
    stream<CreateBookResponse, error?> borrow_bookResponse = check ep->borrow_book(borrow_bookRequest);
    check borrow_bookResponse.forEach(function(CreateBookResponse value) {
        io:println(value);
    });

    CreateBookRequest update_bookRequest = {ISBN: "S3256", title: "English guideline", author_1: "Jay Kris", author_2: "Mike Peter", location: "Second session", status: true};
    stream<SingleBookResponse, error?> update_bookResponse = check ep->update_book(update_bookRequest);
    check update_bookResponse.forEach(function(SingleBookResponse value) {
        io:println(value);
    });
    stream<

SingleBookResponse, error?> list_avaialable_booksResponse = check ep->List_avaialable_books();
    check list_avaialable_booksResponse.forEach(function(SingleBookResponse value) {
        io:println(value);
    });
}

