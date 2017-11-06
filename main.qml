import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

ApplicationWindow {
    visible: true
    minimumWidth: 200
    width: 640
    minimumHeight: 150
    height: 480
    id: window
    title: qsTr("BrabeNetz - Digit Recognizer")

    // File picker for state.nn
    FileDialog {
        id: fileDialog
        title: "Please choose a trained state.nn file"
        nameFilters: [ "BrabeNetz Network State (*.nn)" ]
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
        }
        onRejected: {
            console.log("Canceled")
        }
    }


    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
            ctx.fillRect(0, 0, 50, 50);
        }
    }
}
