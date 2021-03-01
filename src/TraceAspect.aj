
public aspect TraceAspect {
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);

   pointcut constructorToTrace(): classToTrace() && execution(new(..));

   pointcut methodToTrace():  classToTrace() &&  execution(* *(..));

   before(): methodToTrace() {
	   String info = thisJoinPointStaticPart.getSignature() + ", " //
	              //+ thisJoinPointStaticPart.getSourceLocation().getFileName() + ", " //
	              + thisJoinPointStaticPart.getSourceLocation().getLine();
	   System.out.println("[BGN]" + info);
	   }

   after(): methodToTrace() {
      System.out.println("[END]" + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
