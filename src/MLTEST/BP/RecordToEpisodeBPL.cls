/// 
Class MLTEST.BP.RecordToEpisodeBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='User.IctusMap.Record' response='MLTEST.Data.Episode' height='2000' width='2000' >
<context>
<property name='episode' type='MLTEST.Data.Episode' instantiate='1' />
</context>
<sequence xend='201' yend='427' >
<transform name='ADT^A01 to Episode' class='MLTEST.A01ToEpisodeDTL' source='request' target='context.episode' xpos='433' ypos='189' />
<call name='Save episode and calculate stay' target='MLTEST.BO.SaveEpisode' async='1' xpos='459' ypos='320' >
<request type='MLTEST.Data.Episode' >
<assign property="callrequest" value="context.episode" action="set" />
</request>
<response type='MLTEST.Data.Episode' >
<assign property="context.episode" value="callresponse" action="set" />
</response>
</call>
<trace name='Write trace with prediction' value='"Predicted stay = "_context.episode.PredictedStay' xpos='551' ypos='531' />
</sequence>
</process>
}

}
