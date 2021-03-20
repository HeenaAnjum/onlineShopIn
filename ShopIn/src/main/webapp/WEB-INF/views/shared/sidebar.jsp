<p class="lead">your destiny</p>




<div class="list-group">


	<c:forEach items="${categories}" var="category">
		<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a>
	</c:forEach>

	 
</div>

<div>

<img alt="shopIn" src="${images}/poster.jpg" style="width: 100%;height: 500px;">

</div>