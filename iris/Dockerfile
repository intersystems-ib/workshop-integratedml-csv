ARG IMAGE=containers.intersystems.com/intersystems/irishealth-ml-community:2023.2.0.202.0
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown -R irisowner:irisowner /opt/irisapp

USER irisowner

# copy files to image
WORKDIR /opt/irisapp
#COPY --chown=irisowner:irisowner /iris/iris.script iris.script
COPY --chown=irisowner:irisowner src src

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP /iris/irissession.sh /
RUN chmod +x /irissession.sh

SHELL ["/irissession.sh"]

RUN \
zn "%SYS" \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/Test", "ck", , 1) \
if sc do ##class(Test.Installer).Install() \
zn "MLTEST" \
# load lookup tables
do ##class(Ens.Util.LookupTable).%Import("/opt/irisapp/src/Lookup/Hospital.xml") \
do ##class(Ens.Util.LookupTable).%Import("/opt/irisapp/src/Lookup/Province.xml") \
do ##class(Ens.Util.LookupTable).%Import("/opt/irisapp/src/Lookup/HospitalProvince.xml") \
do ##class(Ens.Util.LookupTable).%Import("/opt/irisapp/src/Lookup/Day.xml") \
do ##class(Ens.Util.LookupTable).%Import("/opt/irisapp/src/Lookup/Sex.xml") \
do ##class(Ens.Util.LookupTable).%Import("/opt/irisapp/src/Lookup/SexHL7.xml") \
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/User", "ck", , 1) \ 
set sc = $SYSTEM.OBJ.LoadDir("/opt/irisapp/src/MLTEST", "ck", , 1) \
# start production
set production = "MLTEST.Production" \
set ^Ens.Configuration("csp","LastProduction") = production \
do ##class(Ens.Director).SetAutoStart(production) \
set sc = 1 