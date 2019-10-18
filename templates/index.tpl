{% extends "default.html" %}
{% block content %}
<div class="listCompanies">
    {% for index in range(nr) %}
        {% if index == 0 %}
            <ol>
        {% elif index % 2 == 0 %}
            </ol>
            <ol>
        {% else %}
        {% endif %}
        <ul class="logo"><a href="/company/{{companies[index]}}"><img src='/static/{{companies[index]}}.png' height=100em></a></ul>
    {% endfor %}
    </ol>
</div>

<div class="box">
    <p>Ódýrasta bensínið er hjá {{bensin['company']}}: {{ bensin['bensin95']}}</p>
    <p>Ódýrasta díselið er hjá {{diesel['company']}}: {{ diesel['diesel']}}</p>
    <p> {{ date | format_time }} </p>
</div>
{% endblock %}

