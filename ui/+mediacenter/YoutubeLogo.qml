import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import org.kde.kirigami 2.10 as Kirigami
import org.kde.plasma.components 2.0 as PlasmaComponents
import Mycroft 1.0 as Mycroft

Mycroft.Delegate {
 id: imageRoot
    property string loadingStatus: sessionData.loadingStatus
    
    onLoadingStatusChanged: {
        ldStatus.text = "Loading: " + loadingStatus
    }
    
    Image {
        anchors.fill: parent
        source: "./youtube-logo-page.jpg"
        
        Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent"
            
            Item {
                width: imageRoot.implicitWidth
                height: parent.height / 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Kirigami.Units.gridUnit
                anchors.horizontalCenter: parent.horizontalCenter
                z: 100
                
                PlasmaComponents.BusyIndicator {
                    id: bzindc
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -Kirigami.Units.gridUnit * 6
                    running: true
                }
                
                Kirigami.Heading {
                    id: ldStatus
                    anchors.left: bzindc.right
                    anchors.leftMargin: Kirigami.Units.largeSpacing
                    anchors.verticalCenter: bzindc.verticalCenter
                    level: 2
                    text: "Loading..."
                }
            }
        }
    }
}
