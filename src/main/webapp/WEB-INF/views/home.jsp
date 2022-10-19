<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!-- 페이지 include -->
<%@ include file="include/header.jsp" %>


<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div class="box box-primary">
<div class="box-header with-border">
<h3 class="box-title">Quick Example</h3>
</div>


<form role="form">
<div class="box-body">
<div class="form-group">
<label for="exampleInputEmail1">Email address</label>
<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
</div>
<div class="form-group">
<label for="exampleInputPassword1">Password</label>
<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
</div>
<div class="form-group">
<label for="exampleInputFile">File input</label>
<input type="file" id="exampleInputFile">
<p class="help-block">Example block-level help text here.</p>
</div>
<div class="checkbox">
<label>
<input type="checkbox"> Check me out
</label>
</div>
</div>

<div class="box-footer">
<button type="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</div>


<div class="box">
<div class="box-header with-border">
<h3 class="box-title">Bordered Table</h3>
</div>

<div class="box-body">
<table class="table table-bordered">
<tbody><tr>
<th style="width: 10px">#</th>
<th>Task</th>
<th>Progress</th>
<th style="width: 40px">Label</th>
</tr>
<tr>
<td>1.</td>
<td>Update software</td>
<td>
<div class="progress progress-xs">
<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
</div>
</td>
<td><span class="badge bg-red">55%</span></td>
</tr>
<tr>
<td>2.</td>
<td>Clean database</td>
<td>
<div class="progress progress-xs">
<div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
</div>
</td>
<td><span class="badge bg-yellow">70%</span></td>
</tr>
<tr>
<td>3.</td>
<td>Cron job running</td>
<td>
<div class="progress progress-xs progress-striped active">
<div class="progress-bar progress-bar-primary" style="width: 30%"></div>
</div>
</td>
<td><span class="badge bg-light-blue">30%</span></td>
</tr>
<tr>
<td>4.</td>
<td>Fix and squish bugs</td>
<td>
<div class="progress progress-xs progress-striped active">
<div class="progress-bar progress-bar-success" style="width: 90%"></div>
</div>
</td>
<td><span class="badge bg-green">90%</span></td>
</tr>
</tbody></table>
</div>

<div class="box-footer clearfix">
<ul class="pagination pagination-sm no-margin pull-right">
<li><a href="#">«</a></li>
<li><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">»</a></li>
</ul>
</div>
</div>


<div class="box box-danger">
<div class="box-header with-border">
<h3 class="box-title">Donut Chart</h3>
<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
</button>
<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
</div>
</div>
<div class="box-body">
<canvas id="pieChart" style="height: 178px; width: 357px;" height="178" width="357"></canvas>
</div>

</div>


<%@ include file="include/footer.jsp" %>