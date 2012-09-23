#!/usr/bin/env bash

#BeagleBone Basics
#Copyright (C) 2012 Robert M. Sherbert
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#If by some strange twist you believe that this software would have value for a
#commercial project but are unwilling to be bound by the strictures of the GPL,
#you may contact the author with inquiries for alternative licence terms.

set -e  #quit on error

UDEVDIR=/etc/udev/rules.d

if [ -d $UDEVDIR ]; then
    echo "Copying Ruleset"
    sudo cp 80-beaglebone.rules $UDEVDIR/
    echo "Refreshing Rules"
    sudo udevadm control --reload-rules
    echo "Success"
else
    echo "Can't figure out where to put the udev rules."
    echo "You'll have to install them manually."
    exit 1
fi
