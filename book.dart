//typedef
typedef BookFilter<T> = bool Function(Book a);

class Book {
  String? title, author;
  bool isCheckedOut = false;
  int? yearPublished;
  //List<bool> bookList = [];

  //default constractor
  Book({
    required this.author,
    required this.title,
    required this.yearPublished,
    required this.isCheckedOut,
  });

  //named constractor
  Book.unKnownAuthor({
    this.author = "unknown",
    this.isCheckedOut = false,
  });

  //factory constractor
  factory Book.fromMap(Map<String, dynamic> map) => Book(
      author: map["author"],
      title: map["title"],
      yearPublished: map["yearPublished"],
      isCheckedOut: map["isCheckedOut"]);

  //typedef implementation
  List<Book> filterBook(List<Book> bookList, BookFilter filter) {
    return bookList.where(filter).toList();
  }

  int countCheckedOutBooks(List<Book> bookList) {
    return bookList.where((book) => book.isCheckedOut).length;
  }

  int totalBooksPublishedAfter(List<int> publishedAfter) {
    return publishedAfter.fold(
        0, (previousValue, element) => previousValue + element);
  }

  List<Book>? filterBookByAuthor(List<Book> bookList, String authorName) {
    return bookList.where((author) => author.author == authorName).toList();
  }

  List<String?> getListOfTitles(List<Book> bookList) {
    return bookList.map((book) => book.title).toList();
  }

  void printDetails(List<Book> book) {
    book.toString();
    book.forEach(print);
  }

  String toString() {
    return "Author: $author , title: $title , year published: $yearPublished ,checked out: $isCheckedOut";
  }

  String getBookStatus(Book book) {
    switch (book.isCheckedOut) {
      case true:
        return 'Checked Out';
      case false:
        return 'Available';
    }
    return "";
  }
}
