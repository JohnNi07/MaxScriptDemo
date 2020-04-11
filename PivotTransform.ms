macroScript PivotTransform
	category:"Johnny tools"
	buttonText:"PivotTransform"
	toolTip:"PivotTransform"

	Fn FnSetPivot =
	(
		delta = [0,0,0]
		
		for verts in $.selectedVerts do
			delta += verts.pos
	
		delta /= $.selectedVerts.count
		$.pivot = delta
	)





	

Fn ExportPreTran =
(for i in selection do 
(i.pivot = i.center
i.pivot.z = i.min.z
i.pos =[0,0,0]))

rollout  PivotTransform "PivotTransform "
( 
	
	button   SetPivotToCentry "SetPivotToCentry" orient:#vertical
	button   PreExportTransformPivotAndToOrigin "PreExportTransformPivotAndToOrigin" orient:#vertical
	
on SetPivotToCentry pressed  do 
(
case subobjectLevel of
	(
		2:$.ConvertSelection #Edge #Vertex
		3:$.ConvertSelection #Border #Vertex
		4:$.ConvertSelection #Face #Vertex
		5:$.ConvertSelection #Element #Vertex
	)
	if subobjectLevel == 0 then
		for i in selection do (i.pivot = ((i.max + i.min)/2))
	else
		FnSetPivot()
	)
	on PreExportTransformPivotAndToOrigin pressed  do 
(
ExportPreTran()
	)
)
		



theFloater = newRolloutFloater "PivotTransform" 200 200

addRollout PivotTransform theFloater

 
