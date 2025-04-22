package com.financas.simulador.controller;

import com.financas.simulador.model.*;
import com.financas.simulador.repository.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/transacoes")
@CrossOrigin(origins = "http://simuladorfinanceiro-ramon.netlify.app")
public class TransactionController {
    @Autowired
    private TransactionRepository transactionRepository;

    @GetMapping
    public List<Transaction> listar() {
        return transactionRepository.findAll();
    }

    @PostMapping
    public Transaction salvar(@RequestBody Transaction t) {
        return transactionRepository.save(t);
    }
}
