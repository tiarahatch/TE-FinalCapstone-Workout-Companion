<template>
  <div>
    <div>
      <h2>Welcome New User!</h2>
      <h3>We just need some basic information to get you started!</h3>
    </div>
    <div>
      <form class="form-register">
        
        <label for="firstName" class="sr-only">First Name</label>
        <input
          type="text"
          id="firstName"
          class="form-control"
          placeholder="First Name"
          required
          autofocus
        />
        <br/>
        
        <label for="lastName" class="sr-only">Last Name</label>
        <input type="text" id="lastName" class="form-control" placeholder="Last Name" required />
        <br/>

        <label for="zipCode" class="sr-only">Zip Code</label>
        <input type="text" id="zipCode" class="form-control" placeholder="Zip Code" required />
        <br/>

        <label for="height">Height:</label>
        <select id="height">
          <option />
          <option value="58">4'10"</option>
          <option value="59">4'11"</option>
          <option value="60">5'00"</option>
          <option value="61">5'01"</option>
          <option value="62">5'02"</option>
          <option value="63">5'03"</option>
          <option value="64">5'04"</option>
          <option value="65">5'05"</option>
          <option value="66">5'06"</option>
          <option value="67">5'07"</option>
          <option value="68">5'08"</option>
          <option value="69">5'09"</option>
          <option value="70">5'10"</option>
          <option value="71">5'11"</option>
          <option value="72">6'00"</option>
          <option value="73">6'01"</option>
          <option value="74">6'02"</option>
          <option value="75">6'03"</option>
          <option value="76">6'04"</option>
          <option value="77">6'05"</option>
          <option value="78">6'06"</option>
          <option value="79">6'07"</option>
          <option value="80">6'08"</option>
          <option value="81">6'09"</option>
          <option value="82">6'10"</option>
          <option value="83">6'11"</option>
          <option value="84">7'00"</option>
          <option value="85">7'01"</option>
          <option value="86">7'02"</option>
          <option value="87">7'03"</option>
          <option value="88">7'04"</option>
        </select>
        <br/>
       
        <label for="currentWeight" class="sr-only">Current Weight</label>
        <input
          type="text"
          id="currentWeight"
          class="form-control"
          placeholder="Current Weight"
          required
        />
        <br/>

        <label for="goalWeight" class="sr-only">Goal Weight</label>
        <input
          type="text"
          id="goalWeight"
          class="form-control"
          placeholder="Goal Weight"
          required
        />
        <br/>
        
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit Info</button>
      </form>
    </div>
  </div>
</template>


<script>
export default {
  name: 'new-user',
  data(){
    return{
      
    }
  }
}

</script>

<style scoped>
</style>