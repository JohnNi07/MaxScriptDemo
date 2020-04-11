macroScript AlignPivotToFaceNormal
	category:"Johnny Tools"
	toolTip:"align Local pivot to selected FaceNormal"
	buttonText:"AlignPivotToFaceNormal"
	(
		
tmpMesh = snapShotAsMesh selection[1]
	selFaces = (getFaceSelection tmpMesh as array)
	face = selFaces[1]
	if selFaces.count>1 then
						(
							combinedPos = [0,0,0]
							combinedDir = [0,0,0]
							
							for currFace in selFaces do
							(
								currFacePos = (meshOp.getFaceCenter tmpMesh currFace)
								combinedPos = (combinedPos + currFacePos)
							)
							faceCenter = (combinedPos/selFaces.count )
						)
						else
						(
							faceCenter = meshOp.getFaceCenter tmpMesh selFace
							
						)
	global faceNormal = getFaceNormal tmpMesh face*-1
	
	
 
	vv = getFace tmpMesh face
	dir = normalize ((getVert tmpMesh vv[2]) - (getVert tmpMesh vv[1]))
	side = normalize (cross dir faceNormal)
	front = normalize (cross faceNormal side)
	global theMatrix = matrix3  dir side faceNormal faceCenter

fn RotatePivotOnly obj rotation = (local rotValInv=inverse (rotation as quat)
animate off in coordsys local obj.rotation*=RotValInv
obj.objectoffsetpos*=RotValInv
obj.objectoffsetrot*=RotValInv
)
	RotatePivotOnly selection[1](inverse selection[1].transform.rotationpart)
	RotatePivotOnly selection[1](theMatrix.rotationpart)
	selection[1].pivot =   faceCenter
					
				)

	

		
	 
	