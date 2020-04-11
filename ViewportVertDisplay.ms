macroScript ViewportVertDisplay
	category:"Johnny Tools"
	toolTip:"ViewportVertDisplay"
	buttonText:"ViewportVertDisplay"
	(
		 
		
  fn ViewportTextDisplay  =
(
	obj=$
	
	
	gw.setTransform(Matrix3 1)
	for obj in objects where obj.isselected == true and (classOf obj == Editable_Poly) do
	(
		
		
		
		
		for vert in (#{1..$.verts.count}) do
		
		gw.text(polyop.getVert $ vert )( vert as string)color:yellow
		)
		gw.updateScreen()
		
		)
		

rollout  ViewportVertDisplay "ViewportVertDisplay "
( 
	
	button   ShowVertexOrder "ShowVertexOrder" orient:#vertical
	button   ShowVertexOrderOff "ShowVertexOrderOff" orient:#vertical
	
on ShowVertexOrder pressed  do 
(registerRedrawViewsCallback ViewportTextDisplay
	)
	on ShowVertexOrderOff pressed  do 
(unregisterRedrawViewsCallback ViewportTextDisplay
	)
)
		



theFloater = newRolloutFloater "ViewportVertDisplay" 200 200

addRollout ViewportVertDisplay theFloater
	)
		
		

		
		