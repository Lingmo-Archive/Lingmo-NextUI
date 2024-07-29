/*
 *  SPDX-FileCopyrightText: 2019 Björn Feber <bfeber@protonmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.lingmoui as LingmoUI

/**
 * @brief A section delegate for the primitive ListView component.
 *
 * It's intended to make all listviews look coherent.
 *
 * Any additional content items will be positioned in a row at the trailing side
 * of this component.
 *
 * Example usage:
 * @code
 * import QtQuick
 * import QtQuick.Controls as QQC2
 * import org.kde.lingmoui as LingmoUI
 *
 * ListView {
 *     section.delegate: LingmoUI.ListSectionHeader {
 *         text: section
 *
 *         QQC2.Button {
 *             text: "Button 1"
 *         }
 *         QQC2.Button {
 *             text: "Button 2"
 *         }
 *     }
 * }
 * @endcode
 */
QQC2.ItemDelegate {
    id: listSection

    /**
     * @brief This property sets the text of the ListView's section header.
     * @property string label
     * @deprecated since 6.2 Use base type's AbstractButton::text property directly
     */
    @Deprecated { reason: "Use base type's AbstractButton::text property directly" }
    property alias label: listSection.text

    default property alias _contents: rowLayout.data

    hoverEnabled: false

    activeFocusOnTab: false

    // we do not need a background
    background: Item {}

    topPadding: LingmoUI.Units.largeSpacing + LingmoUI.Units.smallSpacing

    contentItem: RowLayout {
        id: rowLayout
        spacing: LingmoUI.Units.largeSpacing

        LingmoUI.Heading {
            Layout.maximumWidth: rowLayout.width
            Layout.alignment: Qt.AlignVCenter

            opacity: 0.7
            level: 5
            type: LingmoUI.Heading.Primary
            text: listSection.text
            elide: Text.ElideRight

            // we override the Primary type's font weight (DemiBold) for Bold for contrast with small text
            font.weight: Font.Bold

            Accessible.ignored: true
        }

        LingmoUI.Separator {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            Accessible.ignored: true
        }
    }
}
