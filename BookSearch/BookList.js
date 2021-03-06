'use strict';

var React = require('react-native');
var BookDetail = require('./BookDetail');

// var FAKE_BOOK_DATA = [
//     {volumeInfo: {title: 'The Catcher in the Rye', authors: "J. D. Salinger", imageLinks: {thumbnail: 'http://books.google.com/books/content?id=PCDengEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'}}}
// ];
var REQUEST_URL = 'https://www.googleapis.com/books/v1/volumes?q=subject:fiction';

var {
    Image,
    Text,
    StyleSheet,
    View,
    Component,
    ListView,
    TouchableHighlight,
    ActivityIndicatorIOS
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
    },
    listView: {
      backgroundColor: '#F5FCFF'
    },
    loading: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center'
   }
});

class BookList extends Component {
    constructor(props) {
    // The DataSource is an interface that ListView uses to determine which rows have changed over the course of updates to the UI. We provide a function that compares the identity of a pair of rows and this is used to determine the changes in a list of data.
         super(props);
         this.state = {
              isLoading: true,
              dataSource: new ListView.DataSource({
                  rowHasChanged: (row1, row2) => row1 !== row2
              })
         };
    }

    componentDidMount() {
      this.fetchData();
      // componentDidMount() is called when the component is loaded/mounted onto the UI view. When the function is called, we set the datasource property with data from our data object.
        // var books = FAKE_BOOK_DATA;
        // this.setState({
        //     dataSource: this.state.dataSource.cloneWithRows(books)
        // });
    }

    fetchData() {
      fetch(REQUEST_URL)
      .then((response) => response.json())
      .then((responseData) => {
        this.setState({
          dataSource: this.state.dataSource.cloneWithRows(responseData.items),
          isLoading: false
        });
      })
      .done();
    }

    showBookDetail(book) {
         this.props.navigator.push({
             title: book.volumeInfo.title,
             component: BookDetail,
             passProps: {book}
         });
     }

    renderBook(book) {
      //  TouchableHighlight component. This is a wrapper for making views respond properly to touches. On press down, the opacity of the wrapped view is decreased, which allows the underlay color to show through, darkening or tinting the view. With this, if you press down on a ListView row, you will see the highlight color
       return (
            <TouchableHighlight onPress={() => this.showBookDetail(book)} underlayColor="#dddddd">
                <View>
                    <View style={styles.container}>
                        <Image source={{uri: book.volumeInfo.imageLinks.thumbnail}}
                               style={styles.thumbnail} />
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

    renderLoadingView() {
        return (
            <View style={styles.loading}>
                <ActivityIndicatorIOS
                    size='large'/>
                <Text>
                    Loading books...
                </Text>
            </View>
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
        if (this.state.isLoading) {
            return this.renderLoadingView();
        }

        return (
          <ListView
              dataSource={this.state.dataSource}
              renderRow={this.renderBook.bind(this)}
              style={styles.listView} />
        );
    }
}

module.exports = BookList;
