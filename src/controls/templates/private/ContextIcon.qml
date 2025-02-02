/*
 *  SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import org.kde.lingmoui as LingmoUI

Item {
    id: canvas

    property LingmoUI.OverlayDrawer drawer
    property color color: LingmoUI.Theme.textColor
    property int thickness: 2

    property real position: drawer?.position ?? 0

    width: LingmoUI.Units.iconSizes.smallMedium
    height: LingmoUI.Units.iconSizes.smallMedium
    opacity: 0.8
    layer.enabled: true

    LayoutMirroring.enabled: false
    LayoutMirroring.childrenInherit: true

    Item {
        id: iconRoot
        anchors {
            fill: parent
            margins: LingmoUI.Units.smallSpacing
        }
        Rectangle {
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: (parent.height / 2 - canvas.thickness / 2) * canvas.position
            }
            antialiasing: canvas.position !== 0
            transformOrigin: Item.Center
            width: (1 - canvas.position) * height + canvas.position * Math.sqrt(2 * parent.width * parent.width)
            height: canvas.thickness
            color: canvas.color
            rotation: 45 * canvas.position
        }

        Rectangle {
            anchors.centerIn: parent
            width: height
            height: canvas.thickness
            color: canvas.color
        }

        Rectangle {
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: (parent.height / 2 - canvas.thickness / 2) * canvas.position
            }
            antialiasing: canvas.position !== 0
            transformOrigin: Item.Center
            width: (1 - canvas.position) * height + canvas.position * Math.sqrt(2 * parent.width * parent.width)
            height: canvas.thickness
            color: canvas.color
            rotation: -45 * canvas.position
        }
    }
}
