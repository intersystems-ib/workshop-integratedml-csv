/// RECORDMAP: Modified during compilation of RecordMap 'User.IctusMap'
/// on 2023-06-19 at 09:14:24.976 [2023-06-19 09:14:24.976 UTC]
/// by user SuperUser
Class User.IctusMap Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "User.IctusMap.Record";

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd && (""=pLookAhead) {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, "", 0)
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tCurrString = ""
	Set tSeps = $listbuild($char(59))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.FechaIngreso = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.FechaAlta = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.DiaSemanaIngreso = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.DiaSemanaAlta = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.ZonaBasica = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.Ambito = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.Hospital = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.Area = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.Provincia = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.Edad = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.Sexo = tCurrString
	}
	Quit tStatus
}

/// THIS IS GENERATED CODE. DO NOT EDIT.<br/>
/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Set tmpStream=##class(%Stream.TmpBinary).%New()
	Do tmpStream.Write($select(pHasTopFields: pObject.FechaIngreso,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.FechaAlta,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.DiaSemanaIngreso,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.DiaSemanaAlta,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.ZonaBasica,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.Ambito,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.Hospital,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.Area,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.Provincia,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.Edad,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.Sexo,1: ""))
	Set tStatus = tmpStream.Write($char(13,10))
	If $$$ISERR(tStatus) Quit tStatus
	Do pStream.CopyFrom(tmpStream,,0,.tStatus)
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("User.IctusMap.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="User.IctusMap" type="delimited" char_encoding="UTF-8" targetClassname="User.IctusMap.Record" recordTerminator="\x0d\x0a">
  <Separators>
    <Separator>;</Separator>
  </Separators>
  <Field name="FechaIngreso" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="FechaAlta" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="DiaSemanaIngreso" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="DiaSemanaAlta" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="ZonaBasica" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Ambito" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Hospital" datatype="%String">
  </Field>
  <Field name="Area" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="Provincia" datatype="%String">
  </Field>
  <Field name="Edad" datatype="%String">
  </Field>
  <Field name="Sexo" datatype="%String">
  </Field>
</Record>
}

}
