#!/bin/bash

export EMACS_CONFIG="$HOME/.emacs"
echo ">>> Setting emacs' environment, using 4 spaces..."
echo "(setq-default indent-tabs-mode nil)" > $EMACS_CONFIG
echo "(setq tab-width 4)" >> $EMACS_CONFIG
echo "(setq-default c-basic-offset 4)" >> $EMACS_CONFIG
echo "(setq make-backup-files nil)" >> $EMACS_CONFIG
