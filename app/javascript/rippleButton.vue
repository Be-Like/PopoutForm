<template>
  <button class="btn-submit" ref="tiBtn" @click="animateRipple">
    {{text}}
    <span
      class="ripple"
      v-bind:ref="'ripple-' + i"
      v-for="(val, i) in ripples"
      v-bind:key="i"
      v-bind:style="{'top': val.y + 'px', 'left': val.x + 'px'}"
      @animationend="rippleEnd(i)"
    ></span>
  </button>
</template>

<script>
export default {
  props: {
    text: ""
  },
  data: function() {
    return {
      ripples: []
    };
  },
  methods: {
    animateRipple: function(e) {
      this.$emit("click");
      let el = this.$refs.tiBtn;
      let pos = el.getBoundingClientRect();

      this.ripples.push({
        x: e.clientX - pos.left,
        y: e.clientY - pos.top
      });
    },
    rippleEnd: function(i) {
      this.ripples.splice(i, 1);
    }
  }
};
</script>