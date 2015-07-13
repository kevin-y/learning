function Calendar() {

	// Private attributes
	var 
		config = {

		},
		calendarTable = null,
		calendarHeader = null,
		calendarFooter = null,
		calendarBody = null,
		shortWeekdays: ["一","二","三","四","五","六","日"];

	// Internal functions
	var 
		getDaysOfMonth = function(year, month) {
			var d = new Date(year, month);
			d.setDate(0);
			return d.getDate();
		},
		getLastDayOfMonth = function(date, i) {
			var month = date.getMonth();
			date.setMonth(month + i);
			date.setDate(0);
			return date.getDate();
		}, 
		getWeekOfFirstDay = function(date) {
			date.setDate(1);
			return date.getDay();
		},
		_render() {
			calendarTable = document.createElement('table');
			calendarHeader = document.createElement('thead');
			calendarFooter = document.createElement('tfoot');
			calendarBody = document.createElement('tbody');

			/** 设置日历table的属性 **/
			//calendarTable.id = 'calendar-0';
			calendarTable.className = 'calendar-table';
			calendarTable.cellPadding = '0';
			calendarTable.cellSpacing = '2';

			/** 初始化日历头部 **/
			var 
				calendarHeaderTh = document.createElement('th'),
				preMonthA = document.createElement('a'),
				nextMonthA = document.createElement('a'),
				ymText	= document.createElement('span'),
				preMonthTd = document.createElement('td'),
				nextMonthTd = document.createElement('td'),
				ymTextTd = document.createElement('td');

			preMonthA.href = 'javascript:void(0)';
			preMonthA.innerHTML = '<<';
			preMonthTd.appendChild(preMonthA);

			ymText.innerHTML = '2014年6月';
			ymTextTd.colSpan = '5';
			ymTextTd.appendChild(ymText);

			nextMonthA.href = 'javascript:void(0)';
			nextMonthA.innerHTML = '>>';
			nextMonthTd.appendChild(nextMonthA);
		
			calendarHeaderTh.appendChild(preMonthTd);
			calendarHeaderTh.appendChild(ymTextTd);
			calendarHeaderTh.appendChild(nextMonthTd);

			/** 初始化日历体 **/
			var i,
				index;
			// 星期
			var 
				weekTr = document.createElement('tr'),
				weekTd = null;

			for(i = 0; i <= 7; i++) {
				index = (i == 7) ? 0 : i;
				weekTd = document.createElement('td');
				weekTd.innerHTML = shortWeekdays[i];
				if(index == 0 || index = 6) {
					weekTd.className = 'weekend';
				}
				weekTr.appendChild(weekTd);
			}
			calendarBody.appendChild(weekTr);

			// 日期
			var 
				days = new Array(35),
				dayTr = null,
				dayTd = null,

			dayTr = document.createElement('tr');


			calendarTable.appendChild(calendarHeader);
			//calendarTable.appendChild(calendarFooter);
			calendarTable.appendChild(calendarBody);

		};

	// External functions
	this.setVisible = function() {

	}
}