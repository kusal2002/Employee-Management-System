
<aside class="left-sidebar">
	<!-- Sidebar scroll-->
	<div>
		<div
			class="brand-logo d-flex align-items-center justify-content-between">
			<a href="./index.jsp" class="text-nowrap logo-img"> <!--<img src="./assets/images/logos/dark-logo.svg" width="180" alt="" />`  -->
				<h1 class="card-title fw-bold">E.M.S</h1>

			</a>
			<div
				class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
				id="sidebarCollapse">
				<i class="ti ti-x fs-8"></i>
			</div>
		</div>




		<!-- Sidebar navigation-->
		<nav class="sidebar-nav scroll-sidebar" data-simplebar="">
			<%
			Integer role = (Integer) session.getAttribute("role");

			if (role != null && role == 1) {
			%>
			<ul id="sidebarnav">
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Home</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/admin/index.jsp"
					aria-expanded="false"> <span> <i
							class="ti ti-layout-dashboard"></i>
					</span> <span class="hide-menu">Dashboard</span>
				</a></li>
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Task</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/admin/insert.jsp"
					aria-expanded="false"> <span> <i class="ti ti-article"></i>
					</span> <span class="hide-menu">Add Employee</span>
				</a></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/admin/display.jsp"
					aria-expanded="false"> <span> <i
							class="ti ti-alert-circle"></i>
					</span> <span class="hide-menu">Manage Employee</span>
				</a></li>

			</ul>

			<%
			} else if (role != null && role == 2) {
			%>
			<ul id="sidebarnav">
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Home</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/gmanager/index.jsp" aria-expanded="false"> <span> <i
							class="ti ti-layout-dashboard"></i>
					</span> <span class="hide-menu">Dashboard</span>
				</a></li>
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Task</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/gmanager/addPayroll.jsp"
					aria-expanded="false"> <span> <i class="ti ti-article"></i>
					</span> <span class="hide-menu">Add Payroll</span>
				</a></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/gmanager/payrolldisplay.jsp"
					aria-expanded="false"> <span> <i
							class="ti ti-alert-circle"></i>
					</span> <span class="hide-menu">Manage Payroll</span>
				</a></li>
			</ul>


			<%
			} else if (role != null && role == 3) {
			%>
			<ul id="sidebarnav">
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Home</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/hrmanager/index.jsp" aria-expanded="false"> <span> <i
							class="ti ti-layout-dashboard"></i>
					</span> <span class="hide-menu">Dashboard</span>
				</a></li>
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Task</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/hrmanager/addleave.jsp"
					aria-expanded="false"> <span> <i class="ti ti-article"></i>
					</span> <span class="hide-menu">Attendance Leave</span>
				</a></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/hrmanager/leaverecordsdisplay.jsp"
					aria-expanded="false"> <span> <i
							class="ti ti-alert-circle"></i>
					</span> <span class="hide-menu">Manage Leave</span>
				</a></li>
			</ul>

			<%
			} else if (role != null && role == 4) {
			%>
			<ul id="sidebarnav">
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Home</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/employee/index.jsp" aria-expanded="false"> <span> <i
							class="ti ti-layout-dashboard"></i>
					</span> <span class="hide-menu">Dashboard</span>
				</a></li>
				<li class="nav-small-cap"><i
					class="ti ti-dots nav-small-cap-icon fs-4"></i> <span
					class="hide-menu">Task</span></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/employee/createtask.jsp"
					aria-expanded="false"> <span> <i class="ti ti-article"></i>
					</span> <span class="hide-menu">Create Task</span>
				</a></li>
				<li class="sidebar-item"><a class="sidebar-link"
					href="/Employee_Management_System/employee/taskdisplay.jsp"
					aria-expanded="false"> <span> <i
							class="ti ti-alert-circle"></i>
					</span> <span class="hide-menu">Manage Task</span>
				</a></li>
				<%
				}
				%>

			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>
