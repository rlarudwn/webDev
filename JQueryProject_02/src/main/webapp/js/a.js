window.onload=()=>{
	for(let i=1;i<=7;i++){
		let img=document.createElement('img')
		img.src=i+'.jpg'
		img.width=i*50
		img.height=i*50
		document.body.appendChild(img)
	}
}