import 'book.dart';

void main() {
  List<Book> bookList = [
    Book(author: "", title: "", yearPublished: 1000, isCheckedOut: true),
    Book(
        title: 'Monster Mayhem',
        author: 'Steve Korte ',
        yearPublished: 2005,
        isCheckedOut: false)
  ];
  Book.unKnownAuthor();

  Book.fromMap({
    'title': 'Nose pickers from outer space',
    'author': 'Gordon Korman',
    'yearPublished': 1999,
    'isCheckedOut': true,
  });

  Book book = Book.unKnownAuthor();
  Book book2 = Book.fromMap({
    'title': 'Another Book',
    'author': 'Another Author',
    'yearPublished': 2010,
    'isCheckedOut': false,
  });

  print("filter the books by author: ");
  book2
      .filterBookByAuthor(bookList, 'Author 1')!
      .forEach((book) => print(book.title));

  print("the book title: ");
  book2.getListOfTitles(bookList).forEach((title) => print(title));

  print("book details: ");
  book2.printDetails(bookList);

  print("total books published after 2003: ");
  book2.totalBooksPublishedAfter([2003]);
}
