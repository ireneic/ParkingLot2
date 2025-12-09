package com.parking.parkinglot2.ejb;

import com.parking.parkinglot2.common.CarDto;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.example.parkinglot.entities.Car;
import org.example.parkinglot.entities.User;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;


@Stateless
public class CarsBean {

    private static final Logger LOG = Logger.getLogger(CarsBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;

    public List<CarDto> findAllCars() {
        LOG.info("findAllCars");
        try {
            TypedQuery<Car> typedQuery =
                    entityManager.createQuery("SELECT c FROM Car c", Car.class);
            List<Car> cars = typedQuery.getResultList();
            return copyCarsToDto(cars);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<CarDto> copyCarsToDto(List<Car> cars) {
        List<CarDto> carsDtos = new ArrayList<>();
        if(cars == null) {
            return carsDtos;
        }

        for (Car car : cars) {
            CarDto dto=new CarDto(car.getId(),car.getLicensePlate(),car.getParkingSpot(), car.getOwner().getUsername());
            carsDtos.add(dto);
        }
        return carsDtos;
    }

    public void createCar(String licensePlate, String parkingSpot, Long userId){
        LOG.info("createCar");

        Car car = new Car();
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        User user= entityManager.find(User.class, userId);
        user.getCars().add(car);
        car.setOwner(user);

        entityManager.persist(car);

    }

    public CarDto findById(Long carId) {
        LOG.info("findById: " + carId);
        try {
            // Find the Car entity by ID
            Car car = entityManager.find(Car.class, carId);
            if (car == null) {
                return null;
            }

            // Convert to CarDto
            CarDto dto = new CarDto(
                    car.getId(),
                    car.getLicensePlate(),
                    car.getParkingSpot(),
                    car.getOwner() != null ? car.getOwner().getUsername() : null
            );
            return dto;
        } catch (Exception ex) {
            throw new EJBException(ex);
        }

    }
    public void updateCar(Long carId,String licensePlate, String parkingSpot, Long userId){
        LOG.info("updateCar");
        Car car = entityManager.find(Car.class, carId);
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        User oldUser = car.getOwner();
        oldUser.getCars().remove(car);

        User user=entityManager.find(User.class, userId);
        user.getCars().add(car);
        car.setOwner(user);
    }

}


