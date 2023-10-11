#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

cd "$BASEDIR"

cd ..

flutter pub get

flutter gen-l10n

dart format app/app_main/lib/localizations/generated/

#flutter packages pub run flutter_arb_translator:main --dir localizations/ --from en --to af  --to ar --to az --to bg --to ca --to cs --to da --to de --to el --to en --to eu --to fa --to fa --to fi --to fr --to gl --to he --to hi --to hr --to hu --to id --to it --to ja --to ko --to la --to lt --to mk --to no --to nl --to pl --to pt --to pt_br --to ro --to ru --to sv --to sk --to sl --to es --to sr --to th --to tr --to uk --to vi --to zh_cn --to zh_tw --to zu --service google
read var1
#ua uk Ukraine