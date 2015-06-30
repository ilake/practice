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
    Component,
    ListView,
    TouchableHighlight,
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
    },
    separator: {
        height: 1,
        backgroundColor: '#dddddd'
    }
});

class BookList extends Component {
    constructor(props) {
    // The DataSource is an interface that ListView uses to determine which rows have changed over the course of updates to the UI. We provide a function that compares the identity of a pair of rows and this is used to determine the changes in a list of data.
         super(props);
         this.state = {
             dataSource: new ListView.DataSource({
                 rowHasChanged: (row1, row2) => row1 !== row2
             })
         };
    }
    
    componentDidMount() {
      // componentDidMount() is called when the component is loaded/mounted onto the UI view. When the function is called, we set the datasource property with data from our data object.
        var books = FAKE_BOOK_DATA;
        this.setState({
            dataSource: this.state.dataSource.cloneWithRows(books)
        });
    }

    renderBook(book) {
      //  TouchableHighlight component. This is a wrapper for making views respond properly to touches. On press down, the opacity of the wrapped view is decreased, which allows the underlay color to show through, darkening or tinting the view. With this, if you press down on a ListView row, you will see the highlight color
       return (
            <TouchableHighlight>
                <View>
                    <View style={styles.container}>
                        <View style={styles.rightContainer}>
                            <Text style={styles.title}>{book.volumeInfo.title}</Text>
                            <Text style={styles.author}>{book.volumeInfo.authors}</Text>
                        </View>
                    </View>
                    <View style={styles.separator} />
                </View>
            </TouchableHighlight>
       );
    }

    render() {
            // <View style={styles.container}>
            //     <Image source={{uri: book.volumeInfo.imageLinks.thumbnail}}
            //            style={styles.thumbnail} />
            //     <View style={styles.rightContainer}>
            //         <Text style={styles.title}>{book.volumeInfo.title}</Text>
            //         <Text style={styles.author}>{book.volumeInfo.authors}</Text>
            //     </View>
	          // </View>
        return (
          <ListView
              dataSource={this.state.dataSource}
              renderRow={this.renderBook.bind(this)}
              style={styles.listView} />
        );
    }
}

module.exports = BookList;
