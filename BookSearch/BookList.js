'use strict';

var React = require('react-native');

var FAKE_BOOK_DATA = [
    {volumeInfo: {title: 'The Catcher in the Rye', authors: "J. D. Salinger", imageLinks: {thumbnail: 'http://books.google.com/books/content?id=PCDengEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'}}}
];

var {
    Image,
    Text,
    StyleSheet,
    View,
    Component
   } = React;

var styles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
        padding: 10
    },
    thumbnail: {
        width: 53,
        height: 81,
        marginRight: 10
    },
    rightContainer: {
        flex: 1
    },
    title: {
        fontSize: 20,
        marginBottom: 8
    },
    author: {
        color: '#656565'
    }
});

class BookList extends Component {
    render() {
        var book = FAKE_BOOK_DATA[0];

                // <Image source={{uri: book.volumeInfo.imageLinks.thumbnail}}
                //        style={styles.thumbnail} />
        return (
            <View style={styles.container}>
                <View style={styles.rightContainer}>
                    <Text style={styles.title}>{book.volumeInfo.title}</Text>
                    <Text style={styles.author}>{book.volumeInfo.authors}</Text>
                </View>
	          </View>
        );
    }
}

module.exports = BookList;
