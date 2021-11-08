package com.example.drevo.repositories;

import com.example.drevo.entities.Country;
import com.example.drevo.entities.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CountryRepository extends CrudRepository<Country, Long> {

    @Query("from Country")
    List<Country> getCountries();
}