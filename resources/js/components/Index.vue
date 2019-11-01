<template>
    <div>
        <div style="position: fixed;left: 643px;top: 200px;">
            <h4> Total Price </h4>
            &euro;&nbsp;{{ parseFloat(orderPrice).toFixed(2) }}
        </div>
        <ul class="list-group list-group-item-primary" style="width: 485px;">
            <li v-for="item in pizzaData">
                <input type="checkbox" v-on:click="showPrice($event.target.value)" :value="parseFloat(item.pizza_price).toFixed(2)"/> {{ item.pizza_name}}
                <div>
                    <ul class="list-group">
                        <li v-for="topping in item.toppings" class="list-group-item">
                            <input type="checkbox" v-on:click="modifyToppings($event.target.value, topping.topping_price)" :value="topping.topping_name" :checked="true"/> {{ topping.topping_name }} - &euro;{{ parseFloat(topping.topping_price).toFixed(2) }}
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        name: "Index",
        data() {
            return {
                pizzaData: '',
                pizzaPrice: 0.00,
                orderPrice:0.00,
                pizzaSelected: false,
                items: [],
                toppings: [],
            };
        },
        methods : {
            getPizzaInfo() {
                axios.post('/pizza/public/index.php/pizza_data').then(resp => {
                    const responseString = JSON.stringify(resp);
                    this.pizzaData = JSON.parse(responseString).data;
                    for (var key in this.pizzaData) {
                        for(var toppingKey in this.pizzaData[key].toppings)
                        {
                            this.toppings.push([this.pizzaData[key].toppings[toppingKey].topping_name,
                                this.pizzaData[key].toppings[toppingKey].topping_price]);
                        }
                    }
                });
            },

            modifyToppings(topping_name, topping_price) {
                let toppingPrice = this.toppings.find(topping => topping[0] === topping_name);
                let index = this.toppings.findIndex(item => item[0] === topping_name);
                if(this.pizzaSelected) {
                    if(index == -1) {
                        this.toppings.push([topping_name, topping_price]);
                        this.orderPrice += parseFloat(topping_price);
                    } else {
                        this.orderPrice -= parseFloat(toppingPrice[1]);
                        this.toppings.splice(index, 1);
                    }
                }
            },

            showPrice(pizzaprice) {
                this.pizzaSelected = true;
                if(!this.items.includes(pizzaprice)) {
                    this.items.push(pizzaprice);
                    this.pizzaPrice += parseFloat(pizzaprice);
                    this.orderPrice += parseFloat(pizzaprice);
                } else {
                    var index = this.items.findIndex(item => item === pizzaprice);
                    this.pizzaPrice -= parseFloat(this.items[index]);
                    this.orderPrice -= parseFloat(this.items[index]);
                    this.items.splice(index, 1);
                }
            }
        },
        created: function() {
            this.getPizzaInfo();
        },
    }
</script>
