<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Edit Car">

    <h2 class="mb-4">Edit Car</h2>

    <form class="needs-validation" novalidate
          method="POST"
          action="${pageContext.request.contextPath}/EditCar">

        <!-- License Plate -->
        <div class="col-md-6 mb-3">
            <label for="license_plate" class="form-label">License Plate</label>
            <input type="text" class="form-control" id="license_plate"
                   name="license_plate" placeholder=""value ="${car.licensePlate}" required>
            <div class="invalid-feedback">
                License Plate is required.
            </div>
        </div>

        <!-- Parking Spot -->
        <div class="col-md-6 mb-3">
            <label for="parking_spot" class="form-label">Parking Spot</label>
            <input type="text" class="form-control" id="parking_spot"
                   name="parking_spot" placeholder=""value ="${car.parkingSpot}" required>
            <div class="invalid-feedback">
                Parking Spot is required.
            </div>
        </div>

        <!-- Owner -->
        <div class="col-md-6 mb-3">
            <label for="owner_id" class="form-label">Owner</label>
            <select class="custom-select d-block w-100" id="owner_id" name="owner_id" required>
                <option value="">Choose...</option>
                <c:forEach var="user" items="${users}" varStatus="status">
                    <option value="${user.id}" ${car.ownerName eq user.username ? 'selected' : ''}>${user.username}</option>
                </c:forEach>
            </select>
            <div class="invalid-feedback">
                Owner is required.
            </div>
        </div>
        <input type="hidden" name="car_id" value="${car.id}"/>
        <!-- Submit -->
        <button class="btn btn-primary btn-lg mt-3" type="submit">
            Save
        </button>

    </form>
</t:pageTemplate>
