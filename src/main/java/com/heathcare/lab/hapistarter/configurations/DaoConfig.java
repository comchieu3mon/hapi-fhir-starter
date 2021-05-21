package com.heathcare.lab.hapistarter.configurations;

import ca.uhn.fhir.context.FhirContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class DaoConfig {

    @Bean
    public FhirContext fhirContext() {
        return FhirContext.forR4();
    }
}
