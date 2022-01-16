package com.example.kotlinnativethreading

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}