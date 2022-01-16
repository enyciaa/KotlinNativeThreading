package com.example.kotlinnativethreading

import co.touchlab.stately.freeze

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }

    fun getUnfrozenObject(): MyImmutableDataObject {
        return MyImmutableDataObject()
    }

    fun getFrozenImmutableObject(): MyImmutableDataObject {
        return MyImmutableDataObject().freeze()
    }

    fun getFrozenMutableObject(): MyMutableDataObject {
        return MyMutableDataObject().freeze()
    }

    fun mutateFrozenMutableObject() {
        val frozenObject = MyMutableDataObject().freeze()
        frozenObject.myString = "New string"
    }
}


data class MyImmutableDataObject(
    val myString: String = "Immutable string"
)

data class MyMutableDataObject(
    var myString: String = "Mutable string"
)

