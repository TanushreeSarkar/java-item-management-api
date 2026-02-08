package com.example.ecommerce.service;

import com.example.ecommerce.model.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class ProductService {

    private final Map<Long, Product> productMap = new ConcurrentHashMap<>();
    private final AtomicLong idGenerator = new AtomicLong(1);

    public Product addProduct(Product product) {
        long id = idGenerator.getAndIncrement();
        product.setId(id);
        productMap.put(id, product);
        return product;
    }

    public Optional<Product> getProduct(Long id) {
        return Optional.ofNullable(productMap.get(id));
    }

    public List<Product> getAllProducts() {
        return new ArrayList<>(productMap.values());
    }
}
