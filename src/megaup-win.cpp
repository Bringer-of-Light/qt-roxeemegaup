/**
 * Copyright (c) 2012, WebItUp <contact@webitup.fr>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "megaup.h"

#include <winsparkle.h>

#include <QtCore/qdebug.h>

namespace RoxeeMegaUp{

MegaUp::MegaUp(const QString& aUrl, const QString& companyName, const QString& appName, const QString& version)
{
    qDebug() << "     +++ [Lib] {MegaUp}: constructor";
//        Before calling win_sparkle_init(), you must set appcast URL with win_sparkle_set_appcast_url():
//    win_sparkle_set_automatic_check_for_updates(1);
    if(aUrl){
        win_sparkle_set_appcast_url(aUrl.toStdString().c_str());
    }

    if(companyName){
        win_sparkle_set_app_details(companyName.toStdWString(), appName.toStdWString(), appVersion.toStdWString());
    }
}

MegaUp::~MegaUp()
{
    qDebug() << "     --- [Lib] {MegaUp}: constructor";
//        Finally, you should shut WinSparkle down cleanly when the app exits:
    win_sparkle_cleanup();
}

void MegaUp::checkForUpdates()
{
// Initialize WinSparkle as soon as the app itself is initialized, right
// before entering the event loop:
    qDebug() << "     *** [Lib] {MegaUp}: check for updates";
    win_sparkle_init();
//    win_sparkle_check_update_with_ui();
}

}




///**
//    Sets whether updates are checked automatically or only through a manual call.

//    If disabled, win_sparkle_check_update_with_ui() must be used explicitly.

//    @param  state  1 to have updates checked automatically, 0 otherwise

//    @since 0.4
// */
//WIN_SPARKLE_API void win_sparkle_set_automatic_check_for_updates(int state);

///**
//    Gets the automatic update checking state

//    @return  1 if updates are set to be checked automatically, 0 otherwise

//    @note Defaults to 0 when not yet configured (as happens on first start).

//    @since 0.4
// */
//WIN_SPARKLE_API int win_sparkle_get_automatic_check_for_updates();

///**
//    Sets the automatic update interval.

//    @param  interval The interval in seconds between checks for updates.
//                     The minimum update interval is 3600 seconds (1 hour).

//    @since 0.4
// */
//WIN_SPARKLE_API void win_sparkle_set_update_check_interval(int interval);

///**
//    Gets the automatic update interval in seconds.

//    Default value is one day.

//    @since 0.4
// */
//WIN_SPARKLE_API int win_sparkle_get_update_check_interval();

////@}


///*--------------------------------------------------------------------------*
//                              Manual usage
// *--------------------------------------------------------------------------*/

///**
//    @name Manually using WinSparkle
// */
////@{

///**
//    Checks if an update is available, showing progress UI to the user.

//    Normally, WinSparkle checks for updates on startup and only shows its UI
//    when it finds an update. If the application disables this behavior, it
//    can hook this function to "Check for updates..." menu item.

//    When called, background thread is started to check for updates. A small
//    window is shown to let the user know the progress. If no update is found,
//    the user is told so. If there is an update, the usual "update available"
//    window is shown.

//    This function returns immediately.
// */
//WIN_SPARKLE_API void win_sparkle_check_update_with_ui();
