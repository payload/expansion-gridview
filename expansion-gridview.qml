import QtQuick 2.0
import Ubuntu.Components 0.1
import "helpers.js" as My

MainView {
    id      : root
    width   : units.gu(40)  // magic numbers
    height  : units.gu(71) // taken from lp:gallery-app for phone size

    Tabs {
        id          : tabs
        anchors.fill: parent

        Tab {
            title   : "Expansion"
            page    : Page {
                anchors.fill: parent
                GridView {
                    id              : gridview
                    anchors.fill    : parent
                    anchors.margins : units.gu(1)
                    cellWidth       : units.gu(13)
                    cellHeight      : units.gu(13)
                    model           : mockModel
                    delegate        : ExpandingItem {}
                }
            }
        }
    }

    ListModel {
        id: mockModel

        Component.onCompleted: {
            for (var i=18;i--;)
                append({ color: My.randomColor() });
        }
    }
}
