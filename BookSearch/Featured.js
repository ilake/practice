'use strict';

var React = require('react-native');
var BookList = require('./BookList');

var {
    StyleSheet,
    NavigatorIOS,
    Component
   } = React;

var styles = StyleSheet.create({
    container: {
        flex: 1,
    }
});

class Featured extends Component {
    render() {
        return (
            <NavigatorIOS
                style={styles.container}
                initialRoute={{
                  title: "Featured Books",
                  component: BookList
                }}
            />
        );
    }
}

// exports the Featured class thus making it available for use by other files
module.exports = Featured;
