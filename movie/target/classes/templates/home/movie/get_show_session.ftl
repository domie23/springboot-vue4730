<ul data-time="2020-08-27" class="con screenings-show">
    <li class="th fn-clear">
        <p class="p1">放映时间</p>
        <p class="p2">语言版本</p>
        <p class="p3">影厅</p>
        <p class="p4">现价/影院价（元）</p>
        <p class="p5">选座购票</p>
    </li>
    <#list cinemaHallSessionList as cinemaHallSession>
    <li class="fn-clear">
        <div class="p1">
            <p class="showtime">${cinemaHallSession.showTime}</p>
            <p>${cinemaHallSession.endTime}散场</p>
        </div>
        <div class="p2">
            <p>${cinemaHallSession.cinemaSessionType.getName()}/${cinemaHallSession.movie.language.getName()}</p>
        </div>
        <div class="p3">
            <p>${cinemaHallSession.cinemaHall.name}</p>
        </div>
        <div class="p4">
            <p>
                <strong>${cinemaHallSession.newPrice}</strong>
                <span>/</span><em>${cinemaHallSession.oldPrice}</em>
            </p>
        </div>
        <div class="p5">
            <a href="/home/movie/select_seat?id=${cinemaHallSession.id}" class="btn">选座购票</a>
        </div>
    </li>
    </#list>
</ul>