{% extends "default.html" %}
{% block header %}
<h3> {{ name }} </h3>
{% endblock %}
{% block content %}
<table class="table">
    <tr>
        <th>Staðsetning</th>
        <th>Bensín</th>
        <th>Dísel</th>
    </tr>
    {% for station in stations %}
    <tr>
        <td><a href="/station/{{station['key']}}">{{ station['name'] }}</a></td>
        <td>{{ station['bensin95'] }}</td>
        <td>{{ station['diesel'] }}</td>
    </tr>
    {% endfor %}
</table>
{% endblock %}