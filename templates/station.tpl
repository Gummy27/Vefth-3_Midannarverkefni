{% extends "default.html" %}
{% block header %}
<h3><a href="/company/{{ info['company'] }}">{{ info['company'] }}</a></h3>
{% endblock %}
{% block content %}
<p>Fyrirtæki: {{ info['company'] }}</p>
<p>Staðsetning: <a href="https://www.google.com/maps/@{{info['geo']['lat']}},{{info['geo']['lon']}},18z/" target="_blank">{{ info['name'] }}</a></p>
<p>Einn líter af bensíni {{ info['bensin95'] }}</p>
<p>Einn líter af dísel {{ info['diesel'] }}</p>
{% endblock %}
