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
#include "cocoainit.h"

#include <Cocoa/Cocoa.h>
#include <Sparkle/Sparkle.h>

#include <QtCore/qdebug.h>

namespace RoxeeMegaUp{

class MegaUp::Private
{
	public:
		SUUpdater* updater;
};

MegaUp::MegaUp(const QString& aUrl, const QString& companyName, const QString& appName, const QString& version)
{
    qDebug() << "     +++ [Lib] {MegaUp}: constructor";

    CocoaInitializer initializer;

    d = new Private;

	d->updater = [SUUpdater sharedUpdater];
	[d->updater retain];

    if(aUrl.length()){
        NSURL* url = [NSURL URLWithString:
                [NSString stringWithUTF8String: aUrl.toUtf8().data()]];
        [d->updater setFeedURL: url];
    }
}

MegaUp::~MegaUp()
{
    qDebug() << "     --- [Lib] {MegaUp}: destructor";
    [d->updater release];
	delete d;
}

void MegaUp::checkForUpdates()
{
    qDebug() << "     *** [Lib] {MegaUp}: check for updates";
    [d->updater checkForUpdatesInBackground];
//    [d->updater checkForUpdates];
}



//- (void)setAutomaticallyChecksForUpdates:(BOOL)automaticallyChecks;
//- (BOOL)automaticallyChecksForUpdates;

//- (void)setUpdateCheckInterval:(NSTimeInterval)interval;
//- (NSTimeInterval)updateCheckInterval;

//- (void)setSendsSystemProfile:(BOOL)sendsSystemProfile;
//- (BOOL)sendsSystemProfile;

//- (void)setAutomaticallyDownloadsUpdates:(BOOL)automaticallyDownloadsUpdates;
//- (BOOL)automaticallyDownloadsUpdates;



//// This IBAction is meant for a main menu item. Hook up any menu item to this action,
//// and Sparkle will check for updates and report back its findings through UI.
//- (IBAction)checkForUpdates:sender;

//// This kicks off an update meant to be programmatically initiated. That is,
//// it will display no UI unless it actually finds an update, in which case it
//// proceeds as usual. If the automated downloading is turned on, however,
//// this will invoke that behavior, and if an update is found, it will be
//// downloaded and prepped for installation.
//- (void)checkForUpdatesInBackground;

//// This begins a "probing" check for updates which will not actually offer to
//// update to that version. The delegate methods, though, (up to updater:didFindValidUpdate:
//// and updaterDidNotFindUpdate:), are called, so you can use that information in your UI.
//// Essentially, you can use this to UI-lessly determine if there's an update.
//- (void)checkForUpdateInformation;

//// Date of last update check. Returns null if no check has been performed.
//- (NSDate *)lastUpdateCheckDate;

//// Call this to appropriately schedule or cancel the update checking timer according
//// to the preferences for time interval and automatic checks. If this SUUpdater instance
//// was not present during the application's launch, you must call this method to start
//// the update cycle explicitly.
//- (void)resetUpdateCycle;

//- (BOOL)updateInProgress;

//- (void)setDelegate:(id)delegate; // See below for more information on the delegate.
//- delegate;


}
