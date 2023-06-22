/// 
Class MLTEST.ADTA01ToEpisode Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="MLTEST.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="source" value="HL7ToEpisode"></constraint>
<constraint name="docCategory" value="2.5.1"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="1" comment="">
<send transform="MLTEST.A01ToEpisodeDTL" target="MLTEST.BO.SaveEpisode"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
