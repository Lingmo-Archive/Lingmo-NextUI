// SPDX-FileCopyrightText: 2022 Felipe Kinoshita <kinofhek@gmail.com>
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQuick.Templates as T

/**
 * @brief Chip is a visual object based on AbstractButton
 * that provides a friendly way to display predetermined elements
 * with the visual styling of "tags" or "tokens."
 *
 * @see Chip
 * @since 2.19
 * @inherit QtQuick.Controls.AbstractButton
 */
T.AbstractButton {
    id: chip

    /**
     * @brief This property holds whether or not to display a close button.
     *
     * default: ``true``
     */
    property bool closable: true

    /**
     * @brief This property holds whether the icon should be masked or not. This controls the LingmoUI.Icon.isMask property.
     *
     * default: ``false``
     */
    property bool iconMask: false

    /**
     * @brief This signal is emitted when the close button has been clicked.
     */
    signal removed()
}
