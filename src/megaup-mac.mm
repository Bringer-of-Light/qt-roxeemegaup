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
#include <qDebug>

namespace RoxeeMegaUp{

class MegaUp::Private
{
	public:
		SUUpdater* updater;
};

MegaUp::MegaUp(const QString& aUrl)
{
    CocoaInitializer initializer;

    qDebug() << " [M] UpdaterMac: constructor";

    d = new Private;

	d->updater = [SUUpdater sharedUpdater];
	[d->updater retain];

	NSURL* url = [NSURL URLWithString:
			[NSString stringWithUTF8String: aUrl.toUtf8().data()]];
	[d->updater setFeedURL: url];
}

MegaUp::~MegaUp()
{
    qDebug() << " [M] UpdaterMac: destructor";
    [d->updater release];
	delete d;
}

void MegaUp::checkForUpdates()
{
    qDebug() << " [M] UpdaterMac: check for updates";
    [d->updater checkForUpdatesInBackground];
}

}
