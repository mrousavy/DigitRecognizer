import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("BrabeNetz - Digit Recognizer")

    footer: Label {
        text: qsTr("state.nn: {784,500,100,10}")
        anchors.bottom: parent
        anchors.centerIn: parent
    }
}
