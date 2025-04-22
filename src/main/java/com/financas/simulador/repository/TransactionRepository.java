package com.financas.simulador.repository;

import com.financas.simulador.model.*;
import org.springframework.data.jpa.repository.*;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {

}
