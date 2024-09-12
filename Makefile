publish:
	docker tag jupyter:multi gprao7/jupyter:multi
	docker push gprao7/jupyter:multi

publish-r:
	docker tag jupyter:r-notebook gprao7/jupyter:r-notebook
	docker push gprao7/jupyter:r-notebook